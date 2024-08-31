export const errorHandler = (err, req, res, next) => {

    if (err.name === 'UnauthorizedError')
    {
        return res.status(400).json({ message: 'user not authorized', details :err.message });
    }
    
    else if (err.name === 'ValidationError') {
        return res.status(400).json({
            message: 'validation error',
            details: err.message,
        });
    } else if (err.status === 404) {
        return res.status(404).json({ message: err.message });
    }
    
    else {
        return res.status(500).json({ error: err.name});
         
    }
   
}

